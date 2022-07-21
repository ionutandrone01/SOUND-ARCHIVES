package pojo;


import java.util.HashSet;
import java.util.Set;

public class GenuriMuzicale  implements java.io.Serializable {

	private Long idgen;
	private String nume;
	private String data_aparitie;
	private String tip;
	private Set artisti = new HashSet(0);

	public GenuriMuzicale() {
	}

	public GenuriMuzicale(String nume, String data_aparitie, String tip, Set artisti) {
		this.nume = nume;
		this.tip = tip;
		this.data_aparitie = data_aparitie;
		this.artisti = artisti;
	}

	public Long getIdgen() {
		return this.idgen;
	}

	public void setIdgen(Long idgen) {
		this.idgen = idgen;
	}
	public String getNume() {
		return this.nume;
	}

	public void setNume(String nume) {
		this.nume = nume;
	}
	public String getTip() {
		return this.tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}
	public String getData_aparitie() {
		return this.data_aparitie;
	}

	public void setData_aparitie(String data_aparitie) {
		this.data_aparitie = data_aparitie;
	}
	public Set getArtisti() {
		return this.artisti;
	}

	public void setArtisti(Set artisti) {
		this.artisti = artisti;
	}
}